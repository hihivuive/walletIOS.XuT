 
require "TSLib"--使用本函数库必须在脚本开头引用并将文件放到设备 lua 目录下
function file_exists(file_name)
    local f = io.open(file_name, "r")
    return f ~= nil and f:close()
end
 
init("0",0)
local sz = require("sz")
local http = require("szocket.http") 

function  delTempFile(inpath)
    if inpath~=nil then 
        os.execute("rm   -rf  "..inpath.."/tmp/*");
        os.execute("rm   -rf  "..inpath.."/Library/Caches/*");
        os.execute("rm   -rf  "..inpath.."/Documents/*");
        os.execute("rm   -rf  "..inpath.."/Library/Cookies/*");
    end
end


function split(s, delim)
    if type(delim) ~= "string" or string.len(delim) <= 0 then
        return
    end

    local start = 1
    local t = {}
    while true do
    local pos = string.find (s, delim, start, true) -- plain find
        if not pos then
          break
        end

        table.insert (t, string.sub (s, start, pos - 1))
        start = pos + string.len (delim)
    end
    table.insert (t, string.sub (s, start))

    return t
end


function cls()
    os.execute("rm  -f /var/mobile/Library/Accounts/*")
    os.execute("rm  -f /var/mobile/Library/com.apple.iTunesStore/LocalStorage/*")
    os.execute("rm  -f /var/mobile/Library/com.apple.itunesstored/itunesstored*")
    os.execute("rm  -f /var/mobile/Library/com.apple.itunesstored/play_activity*")
    os.execute("rm  -f /var/mobile/Library/com.apple.itunesstored/updates*")

    local sqlite3=sz.sqlite3
    db = sqlite3.open('/var/mobile/Library/com.apple.itunesstored/kvs.sqlitedb')
    db:execute([[DELETE  FROM KVS_VALUE WHERE key <> 'Storefront']])
    db:execute([[VACUUM]])
    db:close()
end 


    
function findImage(points,img,degree)
    local n = tonumber(degree);
    if not n then
        degree=90
    end
    return findImageInRegionFuzzy(img, degree, points[1][1],points[1][2], points[2][1], points[2][2],0); 
end

function isColor(x,y,c)   --封装函数，函数名 isColor
    local s=80;
    local fl,abs = math.floor,math.abs
    s = fl(0xff*(100-s)*0.01)
    local r,g,b = fl(c/0x10000),fl(c%0x10000/0x100),fl(c%0x100)
    local rr,gg,bb = getColorRGB(x,y)
    if abs(r-rr)<s and abs(g-gg)<s and abs(b-bb)<s then
        return true
    end
end
 
 
 
function iClickByAxis(x,y)
    mSleep(500)
    touchDown(1, x, y)
    mSleep(100)
    touchUp(1, x, y)
end

function file_exists(file_name)
    local f = io.open(file_name, "r")
    return f ~= nil and f:close()
end

function   CreateMac()
    math.randomseed(os.time());
    b_p1 = math.random(1,7) 
    o_batter=string.sub("02468acf",b_p1,b_p1)   --偶数位
    mac_str="";
    bt_str ="";
    for p=1,12 do
        --math.randomseed(os.time());
        b_p = math.random(1,16)  
        rnd_batter=string.sub("0123456789abcdefd",b_p,b_p)

        --toast(rnd_batter)
        --mSleep(1000)
        if p % 2 ==0 then
            if p==2 then 
                mac_str=mac_str..o_batter;--..":";
            else
                if p==12 then 
                    bt_str=mac_str..o_batter;
                    mac_str=mac_str..rnd_batter;
                else
                    mac_str=mac_str..rnd_batter;--..":";
                end
            end
        else
            mac_str=mac_str..rnd_batter;
        end
    end

    return mac_str,bt_str;
end

function   CreateSerial()
    math.randomseed(os.time());
    --随机第一位
    p_1 = math.random(1,28)  
    p_1=string.sub("123456789ABCDFGHJKLMNPQRTVWXY",p_1,p_1)

    --随机第二位
    p_2 = math.random(1,28)  
    p_2=string.sub("123456789ABCDFGHJKLMNPQRTVWXY",p_2,p_2)

    --随机第三位
    p_3 = math.random(1,28)  
    p_3=string.sub("123456789ABCDFGHJKLMNPQRTVWXY",p_3,p_3)

    --随机第四位
    p_4 = math.random(1,28)  
    p_4=string.sub("123456789ABCDFGHJKLMNPQRTVWXY",p_4,p_4)

    --随机第五位   第5位用数字1-9和字母(除ABEIOUSZ外)共27个表示生产周数
    p_5 = math.random(1,26)  
    p_5=string.sub("123456789CDFGHJKLMNPQRTVWXY",p_5,p_5)

    p_6_7_8_table={'TVU','CFV','KL7','C4Z','SIO','DGY','ML3','CTJ','WFG','2MJ','8TR','ASH','B6Z','SKZ','FV4','UZ1','ZJP','LIQ','YHF','QXR','VUL'}
    p_6_7_8=p_6_7_8_table[math.random(1,20)];

    p_9_12_table={'HUJ4','6JKU','AD4K','DFJO','REUP','SVJI','CVK2','KERT','ETVZ','KZY7','UHC2','OPC6','VU4W','KL1A','LP2Z','RFVI','UHKI','6DGJ','CNXE','VYBN','SDF5','LPOW','IOFT','XT7V','WYUZ','NW5S','KJO3','DGTL','FGT9'}
    p_9_12=p_9_12_table[math.random(1,28)];

    return  p_1..p_2..p_3..p_4..p_5..p_6_7_8..p_9_12;
end


function stringToTable(str)  
   local ret = load("return "..str)()  
   return ret  
end 

function CreateIMEI()
    pall="";
    for i = 1, 6 do
        p = math.random(1,9)  
        p=string.sub("0123456789",p,p)
        pall=pall..p;
    end
    
    pall="35203706"..pall;
    
    
    pall_table="{";
    for i = 1, 14  do
        p=string.sub(pall,i,i)
        pall_table=pall_table..'"'..p..'",';
    end
    pall_table=pall_table.."}";
 
    
    
    preImei      = stringToTable(pall_table);
    local sum1   = 0
    local sum2   = 0
    local total  = 0
    local temp   = 0

    for i = 1, 14 do
        if ((i % 2) == 0) then
            -- 将偶数位数字分别乘以2,分别计算个位数和十位数之和(从1开始计数)*/
            temp = (preImei[i] - '0') * 2
            if temp < 10 then
                sum2 = sum2 + temp
            else
                sum2 = sum2 + 1 + temp - 10
            end
        else
            -- 将奇数位数字相加(从1开始计数)*/
            sum1 = sum1 + preImei[i] - '0'
        end
    end

    total = sum1 + sum2

    -- 如果得出的数个位是0则校验位为0,否则为10减去个位数
    if ((total % 10) == 0) then
        return pall..'0'
    else
        return pall..(tostring(10 - (total % 10) + '0'))
    end
end
 

function delLocalDB(aid)
        local sqlite3=sz.sqlite3
        local db = sqlite3.open(local_db_path)
        db:execute("delete  from AppleIds  where  aid="..aid)
        db:execute([[VACUUM]])
        db:close()
end
function delLocalDB2(aid)
        local sqlite3=sz.sqlite3
        local db = sqlite3.open(local_db_path)
        db:execute("delete  from AppleIds  where  id="..aid)
        db:execute([[VACUUM]])
        db:close()
end


function encodeURI(s)
    if s==nil or s=="" then return "" end
    s = string.gsub(s, "([^%w%.%- ])", function(c) return string.format("%%%02X", string.byte(c)) end)
    return string.gsub(s, " ", "+")
end


--获取中英混合UTF8字符串的真实字符数量
function SubStringGetTotalIndex(str)
    local curIndex = 0;
    local i = 1;
    local lastCount = 1;
    repeat 
        lastCount = SubStringGetByteCount(str, i)
        i = i + lastCount;
        curIndex = curIndex + 1;
    until(lastCount == 0);
    return curIndex - 1;
end

function SubStringGetTrueIndex(str, index)
    local curIndex = 0;
    local i = 1;
    local lastCount = 1;
    repeat 
        lastCount = SubStringGetByteCount(str, i)
        i = i + lastCount;
        curIndex = curIndex + 1;
    until(curIndex >= index);
    return i - lastCount;
end

--返回当前字符实际占用的字符数
function SubStringGetByteCount(str, index)
    local curByte = string.byte(str, index)
    local byteCount = 1;
    if curByte == nil then
        byteCount = 0
    elseif curByte > 0 and curByte <= 127 then
        byteCount = 1
    elseif curByte>=192 and curByte<=223 then
        byteCount = 2
    elseif curByte>=224 and curByte<=239 then
        byteCount = 3
    elseif curByte>=240 and curByte<=247 then
        byteCount = 4
    end
    return byteCount;
end

function SubStringUTF8(str, startIndex, endIndex)
    if startIndex < 0 then
        startIndex = SubStringGetTotalIndex(str) + startIndex + 1;
    end

    if endIndex ~= nil and endIndex < 0 then
        endIndex = SubStringGetTotalIndex(str) + endIndex + 1;
    end

    if endIndex == nil then 
        return string.sub(str, SubStringGetTrueIndex(str, startIndex));
    else
        return string.sub(str, SubStringGetTrueIndex(str, startIndex), SubStringGetTrueIndex(str, endIndex + 1) - 1);
    end
end

function findImage(points,img,degree)
    local n = tonumber(degree);
    if not n then
        degree=90
    end
    return findImageInRegionFuzzy(img, degree, points[1][1],points[1][2], points[2][1], points[2][2],0); 
end

function 软件()
x1, y1=findImage({{   0,  903, 0xffffff},{  612, 1096, 0xffffff},},"CD.PNG",30)  --检查账号 9jiancha9.PNG
if (x1~=-1) then 
    os.execute("killall -9 SpringBoard")
    mSleep(10)

    pressHomeKey(0);    --按下 Home 键
    pressHomeKey(1);    --抬起 Home 键
end
local serial = dialogInput("Restore Serial", "Serial", "Restore serial");
if(serial=="") then
    serial = "F4HQN9ELGRY8";
end
--closeApp("*",1) 

mSleep(2000)
clearKeyChain("com.apple.AppStore");
clearPasteboard()
clearCookies()
str1 = clearIDFAV() --清空信息，该函数只支持苹果 iOS 系统
mSleep(500)
cls()

local sqlite3=sz.sqlite3
db = sqlite3.open('/var/mobile/Library/com.apple.itunesstored/kvs.sqlitedb')
db:execute([[DELETE  FROM KVS_VALUE WHERE key <> 'Storefront']])
db:execute([[VACUUM]])
db:close()

os.execute("chmod  7777  /private/var/tmp/");
os.execute("cp  /User/Media/TouchSprite/res/mb.PNG  /private/var/tmp/MobileConfig.plist")
os.execute("chmod  7777  /private/var/tmp/MobileConfig.plist");
os.execute("chmod  7777  /private/var/tmp/MobileConfig2.plist");
toast("Xoa va tao Mac",1)
str2 = clearIDFAV(str1) --清空信息并将备份信息写入
bt_mac,wf_mac=CreateMac();
-- serial=CreateSerial(); 
imei  =CreateIMEI();
local plist = sz.plist
local plfilename = "/private/var/tmp/MobileConfig.plist" 
local atopid_table = plist.read(plfilename)           
--atopid_table["btaddr"]  =bt_mac; 
toast("Chuyen doi T.So",1)
--atopid_table["wifiaddr"]="c4:40:71:1d:58:e3"
atopid_table["IMEI"]    =imei; 
atopid_table["serial"]  =serial

rnd_model_table={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"}
rnd_model=rnd_model_table[math.random(1,#rnd_model_table)];


HWModelStr_table={'51AP','53AP','61AP','56AP','71AP','71mAP','66AP','66mAP','69AP','69uAP','10AP','101AP','11AP','D111AP'}
atopid_table["HWModelStr"]   =rnd_model..HWModelStr_table[math.random(1,14)];


ModelNumber_table={'592','632','QH2','9L2','9K2','AU2','AV2','9K2','UY2','R32','RJ2','4R2','356','1R2'}
atopid_table["ModelNumber"]  =rnd_model..rnd_model..ModelNumber_table[math.random(1,14)];

ProductType_table={'iPhone5,2','iPhone5,3','iPhone5,4','iPhone6,1','iPhone6,2','iPhone7,2','iPhone7,1','iPhone8,1','iPhone8,2','iPhone8,4','iPhone9,1','iPhone9,3','iPhone9,2','iPhone9,4'}
atopid_table["ProductType"]  =ProductType_table[math.random(1,14)];
plist.write(plfilename, atopid_table);
toast("Chuyen doi thoi so dien thoai",1)
 
  
clearKeyChain("com.apple.AppStore");
clearPasteboard()
clearCookies()
mSleep(500)
os.execute("rm  -rf /var/mobile/Library/Accounts/*")
os.execute("rm  -rf /private/var/mobile/Library/Accounts/*")
os.execute("rm  -rf /var/mobile/Library/com.apple.iTunesStore/LocalStorage/*")
os.execute("rm  -rf /var/mobile/Library/com.apple.itunesstored/itunesstored*")
os.execute("rm  -rf /var/mobile/Library/com.apple.itunesstored/play_activity*")
os.execute("rm  -rf /var/mobile/Library/com.apple.itunesstored/updates*")
os.execute("rm  -rf /private/var/mobile/Library/Cookies/* ")
os.execute("rm  -rf /private/var/mobile/Library/Cookies/com.apple.Preferences.binarycookies");
os.execute("rm  -rf /private/var/mobile/Library/Cookies/com.apple.itunesstored.binarycookies");
os.execute("rm  -rf /private/var/mobile/Library/Safari/Bookmarks.db")
os.execute("rm  -rf /private/var/mobile/Library/Safari/Bookmarks.db-shm")
os.execute("rm  -rf /private/var/mobile/Library/Safari/Bookmarks.db-wal")
os.execute("rm  -rf /private/var/mobile/Library/Safari/com.apple.Bookmarks.lock")
os.execute("rm  -rf /private/var/mobile/Library/Safari/SyncedTabsMetadata.plist")
os.execute("rm  -rf /var/mobile/Library/com.apple.itunesstored/*")
os.execute("rm  -rf /var/mobile/Library/Accounts/*")
os.execute("rm  -rf /private/var/mobile/Library/Accounts/*")
os.execute("rm  -rf /var/mobile/Library/com.apple.iTunesStore/LocalStorage/*")
os.execute("rm  -rf /var/mobile/Library/com.apple.itunesstored/itunesstored*")
os.execute("rm  -rf /var/mobile/Library/com.apple.itunesstored/play_activity*")
os.execute("rm  -rf /var/mobile/Library/com.apple.itunesstored/updates*")
os.execute("rm  -rf /private/var/mobile/Library/Cookies/* ")
os.execute("rm  -rf /private/var/mobile/Library/Cookies/com.apple.Preferences.binarycookies");
os.execute("rm  -rf /private/var/mobile/Library/Cookies/com.apple.itunesstored.binarycookies");
os.execute("rm  -f /var/mobile/Library/Accounts/*")
os.execute("rm  -f /var/mobile/Library/com.apple.iTunesStore/LocalStorage/*")
os.execute("rm  -f /var/mobile/Library/com.apple.itunesstored/*")

--local sqlite3=sz.sqlite3
--db = sqlite3.open('/var/mobile/Library/com.apple.itunesstored/kvs.sqlitedb')
--db:execute([[DELETE  FROM KVS_VALUE WHERE key <> 'Storefront']])
--db:execute([[VACUUM]])
--db:close()


toast("Khoi Tao Tham So,...",1)
delTempFile(appDataPath("com.apple.AppStore"));
delTempFile(appDataPath("com.apple.stocks"));
delTempFile(appDataPath("com.apple.Maps"));
delTempFile(appDataPath("com.apple.webapp"));
delTempFile(appDataPath("com.apple.tips"));
delTempFile(appDataPath("com.apple.gamecenter.GameCenterUIService"));
delTempFile(appDataPath("com.apple.mobilesafari"));
delTempFile(appDataPath("com.diary.mood"));
delTempFile(appDataPath("com.apple.iCloudDriveApp"));
delTempFile(appDataPath("com.apple.Fitness"));
delTempFile(appDataPath("com.apple.podcasts"));
toast("Khoi Tao Tham So,...",1)
delTempFile(appDataPath("com.apple.mobileme.fmf1"));
delTempFile(appDataPath("com.apple.AccountAuthenticationDialog"));
delTempFile(appDataPath("com.apple.SafariViewService"));
delTempFile(appDataPath("com.apple.ServerDocuments"));
delTempFile(appDataPath("com.apple.calculator"));
delTempFile(appDataPath("com.apple.news"));
delTempFile(appDataPath("com.apple.mobilemail"));
delTempFile(appDataPath("com.apple.weather"));
delTempFile(appDataPath("com.apple.Music"));
delTempFile(appDataPath("com.apple.gamecenter"));
toast("Khoi Tao Tham So,...",1)
delTempFile(appDataPath("com.apple.HealthPrivacyService"));
delTempFile(appDataPath("com.apple.datadetectors.DDActionsService"));
delTempFile(appDataPath("com.apple.mobilephone"));
delTempFile(appDataPath("com.apple.ios.StoreKitUIService"));
delTempFile(appDataPath("com.apple.iBooks"));
delTempFile(appDataPath("com.apple.facetime"));
delTempFile(appDataPath("com.apple.share"));
delTempFile(appDataPath("com.apple.Health"));
delTempFile(appDataPath("com.apple.webapp1"));
toast("Khoi Tao Tham So,...",1)
delTempFile(appDataPath("com.apple.mobilenotes"));
delTempFile(appDataPath("com.apple.Maps"));
delTempFile(appDataPath("com.apple.WebContentFilter.remoteUI.WebContentAnalysisUI"));
delTempFile(appDataPath("com.apple.MobileStore"));
delTempFile(appDataPath("com.apple.WebViewService"));
delTempFile(appDataPath("com.apple.SafariViewService"));
delTempFile(appDataPath("com.apple.mobilesafari"));

os.execute("cd /User/Media/Downloads/;rm -rf `ls -aR| egrep -v '(*downloads.28.sqlitedb*)'` ");
os.execute("rm   -rf  /private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/AppInstallation/*.*");
os.execute("rm   -rf  /private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/");
os.execute("rm   -rf  /private/var/mobile/Library/Logs/CrashReporter/");
os.execute("rm   -rf  /private/var/mobile/Media/iTunes_Control/Music/*");
os.execute("rm   -rf  /private/var/mobile/Media/Photos/Thumbs/*");
os.execute("rm   -rf  /var/mobile/Library/Caches/com.apple.AppStore/*");
os.execute("rm   -rf  /var/vm/*");


--6S版本清理 
os.execute(' killall -9 MSUnrestrictProc');
os.execute(' killall -9 kernel_task');
os.execute(' killall -9 launchd');
os.execute(' killall -9 syslogd');
os.execute(' killall -9 logd');
os.execute(' killall -9 com.apple.Mobile');
os.execute(' killall -9 IMDPersistenceAg');
os.execute(' killall -9 heard');
os.execute(' killall -9 PPHelperLaunchd');
os.execute(' killall -9 dropbear');
os.execute(' killall -9 mediaserverd');
os.execute(' killall -9 fseventsd');
os.execute(' killall -9 assistantd');
os.execute(' killall -9 fileproviderd');
os.execute(' killall -9 routined');
os.execute(' killall -9 mediaremoted');
os.execute(' killall -9 misd');
os.execute(' killall -9 healthd');
os.execute(' killall -9 configd');
os.execute(' killall -9 powerd');
os.execute(' killall -9 atc');
os.execute(' killall -9 wifid');
os.execute(' killall -9 keybagd');
os.execute(' killall -9 familynotificati');
os.execute(' killall -9 seld');
os.execute(' killall -9 installd');
os.execute(' killall -9 identityservices');
os.execute(' killall -9 touchsetupd');
os.execute(' killall -9 AppleIDAuthAgent');
os.execute(' killall -9 assetsd');
os.execute(' killall -9 wcd');
os.execute(' killall -9 wirelessproxd');
--os.execute(' killall -9 backboardd');
os.execute(' killall -9 askpermissiond');
os.execute(' killall -9 timed');
os.execute(' killall -9 sharingd');
os.execute(' killall -9 locationd');
--os.execute(' killall -9 BTServer');
os.execute(' killall -9 imagent');
-----os.execute(' killall -9 assertiond');
os.execute(' killall -9 tipsd');
os.execute(' killall -9 UserEventAgent');
os.execute(' killall -9 ptpd');
os.execute(' killall -9 lockdownd');
os.execute(' killall -9 iaptransportd');
os.execute(' killall -9 aggregated');
os.execute(' killall -9 fairplayd.H2');
--os.execute(' killall -9 CommCenter');
os.execute(' killall -9 notifyd');
os.execute(' killall -9 cfprefsd');
os.execute(' killall -9 awdd');
os.execute(' killall -9 containermanager');
os.execute(' killall -9 lsd');
os.execute(' killall -9 distnoted');
os.execute(' killall -9 medialibraryd');
os.execute(' killall -9 callservicesd');
os.execute(' killall -9 MobileGestaltHel');
os.execute(' killall -9 tccd');
os.execute(' killall -9 nehelper');
os.execute(' killall -9 WirelessRadioMan');
os.execute(' killall -9 coreduetd');
os.execute(' killall -9 securityd');
os.execute(' killall -9 apsd');
os.execute(' killall -9 nanoregistryd');
os.execute(' killall -9 mobileactivation');
os.execute(' killall -9 accountsd');
os.execute(' killall -9 hangtracerd');
os.execute(' killall -9 BlueTool');
os.execute(' killall -9 OTATaskingAgent');
os.execute(' killall -9 symptomsd');
os.execute(' killall -9 cloudd');
os.execute(' killall -9 kbd');
os.execute(' killall -9 CloudKeychainPro');
os.execute(' killall -9 IDSKeychainSynci');
os.execute(' killall -9 passd');
os.execute(' killall -9 CallHistorySyncH');
os.execute(' killall -9 mapspushd');
os.execute(' killall -9 limitadtrackingd');
os.execute(' killall -9 akd');
os.execute(' killall -9 storebookkeeperd');
os.execute(' killall -9 homed');
os.execute(' killall -9 mDNSResponder');
os.execute(' killall -9 nsurlstoraged');
os.execute(' killall -9 nfcd');
os.execute(' killall -9 fmfd');
os.execute(' killall -9 nsurlsessiond');
os.execute(' killall -9 mDNSResponderHel');
os.execute(' killall -9 DuetHeuristic-BM');
os.execute(' killall -9 lockbot');
os.execute(' killall -9 geod');
os.execute(' killall -9 pfd');
os.execute(' killall -9 networkservicepr');
os.execute(' killall -9 appstored');
os.execute(' killall -9 biometrickitd');
os.execute(' killall -9 pipelined');
os.execute(' killall -9 pkd');
os.execute(' killall -9 useractivityd');
os.execute(' killall -9 adid');
os.execute(' killall -9 calaccessd');
os.execute(' killall -9 fmflocatord');
os.execute(' killall -9 findmydeviced');
os.execute(' killall -9 mobileassetd');
os.execute(' killall -9 captiveagent');
os.execute(' killall -9 ind');
os.execute(' killall -9 misagent');
os.execute(' killall -9 carkitd');
toast("Khoi Tao tham so,...",1)
os.execute(' killall -9 profiled');
os.execute(' killall -9 followupd');
os.execute(' killall -9 bird');
os.execute(' killall -9 duetexpertd');
os.execute(' killall -9 vmd');
os.execute(' killall -9 searchd');
os.execute(' killall -9 webbookmarksd');
os.execute(' killall -9 pasted');
os.execute(' killall -9 softwareupdatese');
os.execute(' killall -9 deleted');
os.execute(' killall -9 suggestd');
os.execute(' killall -9 ServerFileProvid');
os.execute(' killall -9 filecoordination');
os.execute(' killall -9 CacheDeleteITune');
os.execute(' killall -9 revisiond');
os.execute(' killall -9 com.apple.quickl');
os.execute(' killall -9 aslmanager');
os.execute(' killall -9 coresymbolicatio');
os.execute(' killall -9 CacheDeleteAppCo');
os.execute(' killall -9 replayd');
os.execute(' killall -9 swcd');
os.execute(' killall -9 com.apple.CallKi');
os.execute(' killall -9 Hades');
os.execute(' killall -9 afcd');
toast("Khoi Tao tham so,...",1)
os.execute(' killall -9 notification_pro');
os.execute(' killall -9 mobile_installat');
os.execute(' killall -9 afc2d');
os.execute(' killall -9 afc2d');
--os.execute(' killall -9 SpringBoard');
os.execute(' killall -9 itunesstored');
os.execute(' killall -9 com.apple.uifoun');
os.execute(' killall -9 itunescloudd');
os.execute(' killall -9 com.apple.access');
os.execute(' killall -9 syncdefaultsd');
os.execute(' killall -9 online-auth-agen');
--os.execute(' killall -9 Weather');
os.execute(' killall -9 AppStore');
os.execute(' killall -9 splashboardd');
os.execute(' killall -9 accountsd');
os.execute(' killall -9 itunesstored');
os.execute(' killall -9 mDNSResponder');
os.execute(' killall -9 mediaserverd');
os.execute(' killall -9 symptomsd');
os.execute(' killall -9 nanoregistryd');
os.execute(' killall -9 apsd');
os.execute(' killall -9 identityservicesd');
os.execute(' killall -9 calaccessd');
--os.execute(' killall -9 Weather');
closeApp("com.apple.preferences")
--os.execute("killall -9 SpringBoard")
--closeApp("*",1) 
toast("xong qua trinh doi seri")
end
软件()