#Activity Window view setContentView

activity (window view) setContentView() ->  PhoneWindow_setContentView -> (new mDecor mContentParent) ->  mContentParent.addView(view, params); 

## mDecor:FrameLayout
mDecor -> generateDecor() -> DecorView -> FrameLayout 

## mContentParent:ViewGroup
mContentParent -> generateLayout(mDecor) -> mDecor.findById();

##mContentParent:ViewGroup(title)
mContentRoot = (ViewGroup) in;  ->   View in = mLayoutInflater.inflate(layoutResource, null); -> layoutResource = R.layout.screen_title;


#Activity mWindowManager mDecor

* WindowManager_inteface extends ViewManager;  
* WindowManagerImpl implenment WindowManager;

##mWindowManager:WindowManager(通过代理WindowManagerImpl调用， 6.0.1已没有LocalWindowManager)
mWindowManager -> Activity mWindow.getWindowManager() ->  Window_setWindowManager ((WindowManagerImpl)wm).createLocalWindowManager(this); { wm = (WindowManager)mContext.getSystemService(Context.WINDOW_SERVICE);}    ->   WindowManagerImpl_createLocalWindowManager    ->   new WindowManagerImpl(mDisplay, parentWindow) 


#ActivityThread handleResumeActivity
(此函数新建获取WindowManager,并将mDecor所有的View添加到ArrayList进行管理)
ViewManager wm = a.getWindowManager(); ->  wm.addView(mDecor,l_param); ->     WindowManagerImpl_addView  ->  mGlobal.addView ->  mGlobal = WindowManagerGlobal.getInstance()  -> WindowManagerGlobal   
WindowManagerGlobal (ArrayList<View> mViews; ArrayList<ViewRootImpl> mRoots;)  -> WindowManagerGlobal_addView ->    mViews.add(view);  mRoots.add(root);  mParams.add(wparams);

## ViewRootImpl (6.0.1已没有ViewRoot)-> implenment ViewParent 
* handleMessage   
* mSurface  
* W mWindow;  View mView;



#学习
UML  
Java Base -> android Lib   
Framework  


[surface]: http://wiki.jikexueyuan.com/project/deep-android-v1/surface.html