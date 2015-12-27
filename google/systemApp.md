#diff (system.app VS normal.app)
1. signature is system platform key
2. api (private system api)
3. compile add_android.mk -> source build/envsetup.sh&lunch -> mm

#4 system key 
testkey -> default
platform -> platform api
shared  -> /home/contacts
media -> /media/download

#intent filter (app can contain many filters)
1 action; 3 category; 3 data scheme/mimeType; (one filter all match can pass,must&just match one scheme)

#if app has no action.MAIN, it will not show in launcher list

#PackageInstall App (.apk or packagename)


