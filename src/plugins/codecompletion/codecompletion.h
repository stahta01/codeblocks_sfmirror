/*
 * This file is part of the Code::Blocks IDE and licensed under the GNU General Public License, version 3
 * http://www.gnu.org/licenses/gpl-3.0.html
 */

#ifndef CODECOMPLETION_H
#define CODECOMPLETION_H

#include <settings.h> // SDK
#include <cbplugin.h>
#include <cbproject.h>
#include <sdk_events.h>
#include <wx/string.h>

#include "nativeparser.h"
#include "coderefactoring.h"

#include <wx/timer.h>
#include <map>
#include <vector>
#include <set>

class cbEditor;
class wxScintillaEvent;
class wxChoice;
class SystemHeadersThread;

typedef std::map<wxString, StringSet> SystemHeadersMap;

/** code completion plugin can show function tip, give automaticall suggestion
 *  list while entering code, browse all global declaration and symbols of the
 *  source files.
 *
 *  We later use "CC" as an abbreviation of Code Completion plugin.
 * See the general achitecture of code completion plugin on wiki page
 *  http://wiki.codeblocks.org/index.php?title=Code_Completion_Design
 */
class CodeCompletion : public cbCodeCompletionPlugin
{
public:
    /** the underline data structure of the second wxChoice of CC's toolbar*/
    struct FunctionScope
    {
        FunctionScope() {}
        FunctionScope(const NameSpace& ns): StartLine(ns.StartLine), EndLine(ns.EndLine), Scope(ns.Name) {}

        int StartLine;
        int EndLine;
        wxString Name;
        wxString Scope;    // class or namespace
    };

    /** each file contains on such vector, containing all the function infos in the file */
    typedef std::vector<FunctionScope> FunctionsScopeVec;
    /** helper class to support FunctionsScopeVec*/
    typedef std::vector<int> ScopeMarksVec;

    struct FunctionsScopePerFile
    {
        FunctionsScopeVec m_FunctionsScope;
        NameSpaceVec m_NameSpaces;
        bool parsed;
    };
    /** filename -> FunctionsScopePerFile map, contains all the opened documents scope info*/
    typedef std::map<wxString, FunctionsScopePerFile> FunctionsScopeMap;

    /** Constructor */
    CodeCompletion();
    /** Destructor */
    virtual ~CodeCompletion();

    // the function below were virtual functions from the base class
    virtual void OnAttach();
    virtual void OnRelease(bool appShutDown);
    virtual int GetConfigurationGroup() const { return cgEditor; }
    virtual cbConfigurationPanel* GetConfigurationPanel(wxWindow* parent);
    virtual cbConfigurationPanel* GetProjectConfigurationPanel(wxWindow* parent, cbProject* project);
    virtual int Configure();
    virtual void BuildMenu(wxMenuBar* menuBar); // offer for menu space by host
    virtual void BuildModuleMenu(const ModuleType type, wxMenu* menu, const FileTreeData* data = 0);
    virtual bool BuildToolBar(wxToolBar* toolBar);

    // TODO unused, should be removed probably
    virtual wxArrayString GetCallTips() { return wxArrayString(); }
    virtual int CodeComplete();
    virtual void ShowCallTip();

    /** give auto suggestions on preprocessor directives*/
    void CodeCompletePreprocessor();
    /** give auto suggestions after #include */
    void CodeCompleteIncludes();

    /** get the include paths setting by the project
     * @param project project info
     * @param buildTargets target info
     * @return the local include paths
     */
    wxArrayString GetLocalIncludeDirs(cbProject* project, const wxArrayString& buildTargets);

    /** the defualt compilers search paths
     * @param force if false, then it just return a static wxArrayString to optimize the performance
     */
    wxArrayString& GetSystemIncludeDirs(cbProject* project, bool force);

    /** search target file names (mostly relative names) under basePath, then return the absolute dirs*/
    void GetAbsolutePath(const wxString& basePath, const wxArrayString& targets, wxArrayString& dirs);

    /** handle all the editor event*/
    void EditorEventHook(cbEditor* editor, wxScintillaEvent& event);

    /** read CC's options, mostly happens the user change some setting and press APPLY*/
    void RereadOptions(); // called by the configuration panel

private:
    void UpdateToolBar();

    void LoadTokenReplacements();
    void SaveTokenReplacements();

    void OnUpdateUI(wxUpdateUIEvent& event);
    void OnViewClassBrowser(wxCommandEvent& event);
    void OnCodeComplete(wxCommandEvent& event);
    void OnShowCallTip(wxCommandEvent& event);
    void OnGotoFunction(wxCommandEvent& event);
    void OnGotoPrevFunction(wxCommandEvent& event);
    void OnGotoNextFunction(wxCommandEvent& event);
    void OnClassMethod(wxCommandEvent& event);
    void OnUnimplementedClassMethods(wxCommandEvent& event);
    void OnGotoDeclaration(wxCommandEvent& event);
    void OnFindReferences(wxCommandEvent& event);
    void OnRenameSymbols(wxCommandEvent& event);
    void OnOpenIncludeFile(wxCommandEvent& event);
    void OnCurrentProjectReparse(wxCommandEvent& event);
    void OnSelectedProjectReparse(wxCommandEvent& event);
    void OnSelectedFileReparse(wxCommandEvent& event);
    void OnAppDoneStartup(CodeBlocksEvent& event);
    void OnCodeCompleteTimer(wxTimerEvent& event);
    void OnWorkspaceChanged(CodeBlocksEvent& event);
    void OnProjectActivated(CodeBlocksEvent& event);
    void OnProjectClosed(CodeBlocksEvent& event);
    void OnProjectSaved(CodeBlocksEvent& event);
    void OnProjectFileAdded(CodeBlocksEvent& event);
    void OnProjectFileRemoved(CodeBlocksEvent& event);
    void OnProjectFileChanged(CodeBlocksEvent& event);
    void OnUserListSelection(CodeBlocksEvent& event);
    void OnEditorSaveOrModified(CodeBlocksEvent& event);
    void OnEditorOpen(CodeBlocksEvent& event);
    void OnEditorActivated(CodeBlocksEvent& event);
    void OnEditorClosed(CodeBlocksEvent& event);
    void OnCCLogger(wxCommandEvent& event);
    void OnCCDebugLogger(wxCommandEvent& event);
    void OnParserEnd(wxCommandEvent& event);
    void OnParserStart(wxCommandEvent& event);
    void OnValueTooltip(CodeBlocksEvent& event);
    void OnThreadUpdate(wxCommandEvent& event);
    void OnThreadCompletion(wxCommandEvent& event);
    void OnThreadError(wxCommandEvent& event);

    void DoCodeComplete();
    void DoInsertCodeCompleteToken(wxString tokName);
    int DoClassMethodDeclImpl();
    int DoAllMethodsImpl();
    void FunctionPosition(int &scopeItem, int &functionItem) const;
    void GotoFunctionPrevNext(bool next = false);
    int NameSpacePosition() const;
    void OnStartParsingFunctions(wxTimerEvent& event);
    void OnFindFunctionAndUpdate(wxTimerEvent& event);
    void OnScope(wxCommandEvent& event);
    void OnFunction(wxCommandEvent& event);
    void ParseFunctionsAndFillToolbar(bool force = false);
    void FindFunctionAndUpdate(int currentLine);
    void UpdateFunctions(unsigned int scopeItem);
    void EnableToolbarTools(bool enable = true);
    void OnRealtimeParsing(wxTimerEvent& event);
    void OnProjectSavedTimer(wxTimerEvent& event);
    void OnReparsingTimer(wxTimerEvent& event);
    void OnEditorActivatedTimer(wxTimerEvent& event);

    void GotoTokenPosition(cbEditor* editor, const wxString& target, size_t line);

    int                     m_PageIndex;
    bool                    m_InitDone;

    wxMenu*                 m_EditMenu;
    wxMenu*                 m_SearchMenu;
    wxMenu*                 m_ViewMenu;
    wxMenu*                 m_ProjectMenu;

    /** this member will actually manage the many Parser objects*/
    NativeParser            m_NativeParser;
    /** code refectoring tool*/
    CodeRefactoring         m_CodeRefactoring;

    int                     m_EditorHookId;
    int                     m_LastPosForCodeCompletion;

    wxTimer                 m_TimerCodeCompletion;
    wxTimer                 m_TimerFunctionsParsing;
    wxTimer                 m_TimerRealtimeParsing;
    wxTimer                 m_TimerToolbar;
    wxTimer                 m_TimerProjectSaved;
    wxTimer                 m_TimerReparsing;
    wxTimer                 m_TimerEditorActivated;
    cbEditor*               m_LastEditor;
    int                     m_ActiveCalltipsNest;

    bool                    m_IsAutoPopup;
    // The variables below were related to CC's toolbar
    /** the CC's toolbar */
    wxToolBar*              m_ToolBar;
    /** function choice control of CC's toolbar, it is the second choice */
    wxChoice*               m_Function;
    /** namespace/scope choise control, it is the first choice control*/
    wxChoice*               m_Scope;
    /** current active file's function body info*/
    FunctionsScopeVec       m_FunctionsScope;
    /** current active file's namespace/scope info */
    NameSpaceVec            m_NameSpaces;
    /** current active file's line info, helper member to access function scopes*/
    ScopeMarksVec           m_ScopeMarks;
    /** this is a "filename->info" map containing all the opening files choice info*/
    FunctionsScopeMap       m_AllFunctionsScopes;
    /** indicate whether the CC's toolbar need a refresh */
    bool                    m_ToolbarChanged;

    /** current caret line */
    int                     m_CurrentLine;
    /** TODO */
    std::map<wxString, int> m_SearchItem;

    /** the file updating the toolbar info*/
    wxString                m_LastFile;

    /** indicate whether the predefined keywords set should be added in the suggetion list*/
    bool                    m_LexerKeywordsToInclude[9];

    /** indicate the editor has modifled by the user and a real-time parse should be start*/
    bool                    m_NeedReparse;

    /** remember the number of bytes in the current editor/document */
    int                     m_CurrentLength;
    /** collected header file names to support autocompletion after #include*/
    SystemHeadersMap        m_SystemHeadersMap;

    //options on code completion plugins
    bool                    m_UseCodeCompletion;
    int                     m_CCAutoLaunchChars;
    bool                    m_CCAutoLaunch;
    int                     m_CCLaunchDelay;
    size_t                  m_CCMaxMatches;
    bool                    m_CCAutoAddParentheses;
    wxString                m_CCFillupChars;
    bool                    m_CCAutoSelectOne;
    bool                    m_CCEnableHeaders;

    /** thread to collect header file names */
    std::list<SystemHeadersThread*> m_SystemHeadersThread;

    /** map to collect all reparsing files */
    typedef std::map<cbProject*, wxArrayString> ReparsingMap;
    ReparsingMap m_ReparsingMap;

    DECLARE_EVENT_TABLE()
};

#endif // CODECOMPLETION_H
