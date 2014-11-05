-------------------------------------------------------------------------------
-- ~/.xmonad/xmonad.hs: XMonad Configuration File                            --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Packages Used (Arch Linux)                                                --
-------------------------------------------------------------------------------
-- conky-cli (AUR)                                                           --
-- dmenu-xft-height (AUR)                                                    --
-- dzen2-xft-xpm-xinerama (AUR)                                              --
-- ttf-envy-code-r (AUR)                                                     --
-- xmonad                                                                    --
-- xmonad-contrib                                                            --
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Imports                                                                   --
-------------------------------------------------------------------------------
import           Data.List (unwords)
import qualified Data.Map as M
import           Data.Monoid

import           Graphics.X11.ExtraTypes.XF86

import           System.Exit
import           System.IO

import           XMonad
import           XMonad.Hooks.DynamicLog
import           XMonad.Hooks.ManageDocks
import           XMonad.Hooks.ManageHelpers
import           XMonad.Hooks.SetWMName
import           XMonad.Layout.ResizableTile
import           XMonad.Layout.SimpleFloat
import qualified XMonad.StackSet as W
import           XMonad.Util.Run

-------------------------------------------------------------------------------
-- Main Execution                                                            --
-------------------------------------------------------------------------------
main = do
    xmonadBar <- spawnPipe myXmonadBar -- XMonad status in upper left
    statusBar <- spawnPipe myStatusBar -- system status in upper right
    xmonad $ defaultConfig
        { borderWidth        = myBorderWidth
        , keys               = myKeys
        , modMask            = myModMask
        , mouseBindings      = myMouseBindings
        , terminal           = myTerminal
        , workspaces         = myWorkspaces
        , normalBorderColor  = myBorderColorNormal
        , focusedBorderColor = myBorderColorFocused
        -- Hooks
        , handleEventHook    = myEventHook
        , layoutHook         = myLayoutHook
        , logHook            = myLogHook xmonadBar -- feeds log info to xmonadBar
        , manageHook         = myManageHook
        , startupHook        = myStartupHook
        }

-------------------------------------------------------------------------------
-- Configurable Parameters                                                   --
-------------------------------------------------------------------------------
myXmonadDir   = "/home/miles/.xmonad/"
myBorderWidth = 1
myBarFont     = "EnvyCodeR-10"
myBarHeight   = 18
myIconDir     = myXmonadDir ++ "icons/"
myModMask     = mod4Mask
myTerminal    = "urxvt"
myWorkspaces  = map show [1..9] -- ["1", "2", ...]

myScreenWidth  = 1600 -- used for Dzen bar placement

myDateFormat = "%B %-d %A %H:%M" -- August 31 Saturday 21:18
myStatusBarWidth = 675               -- width of the Dzen bar in pixels used to display the current time

-------------------------------------------------------------------------------
-- Colors                                                                    --
-------------------------------------------------------------------------------

myAccentColor = "#9ECE9E" -- zen-green
--myAccentColor = "#DCA3A3" -- zen-red
--myAccentColor = "#8CD0D3" -- zen-blue
--myAccentColor = "#EFEFAF" -- zen-yellow
--myAccentColor = "#8C8CBC" -- zen-purple

-- Window Border Colors
myBorderColorFocused = "#666666"
myBorderColorNormal  = "#444444"

-- Workspace Name Colors
myWsColorFgCurrent     = "#252525"
myWsColorBgCurrent     = myAccentColor

myWsColorFgHidden      = myAccentColor
myWsColorBgHidden      = "#252525"

myWsColorFgHiddenEmpty = "#666666"
myWsColorBgHiddenEmpty = ""

myWsColorFgVisible     = "#FE7831"
myWsColorBgVisible     = ""

myWsColorFgUrgent      = "#FF6600"
myWsColorBgUrgent      = "#353535"

-- Icon Colors
myIconColorSysInfo = myAccentColor
myIconColorLayout  = myAccentColor

-- Dzen Colors
myDzenColorBg = "#252525"
myDzenColorFg = "#DDDDDD"

myDmenuNormalFg   = myDzenColorFg
myDmenuNormalBg   = myDzenColorBg
myDmenuSelectedFg = myDzenColorBg
myDmenuSelectedBg = myAccentColor

myDmenu :: String -- requires dmenu-xft-height
myDmenu = "dmenu_run -fn '" ++ myBarFont ++ "' -h '" ++ show myBarHeight ++ "' -nf '" ++ myDmenuNormalFg ++ "' -nb '" ++ myDmenuNormalBg ++ "' -sf '" ++ myDmenuSelectedFg ++ "' -sb '" ++ myDmenuSelectedBg ++ "'"

-- Miscellaneous
mySeparatorColor   = ""
myWindowTitleColor = ""
myWsSepColor       = ""
myLogSepColor      = ""

-------------------------------------------------------------------------------
-- Key Bindings                                                              --
-------------------------------------------------------------------------------
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm .|. shiftMask, xK_Return ), spawn $ XMonad.terminal conf)       -- Launch a terminal
    , ((modm,               xK_p      ), spawn myDmenu)                      -- Launch dmenu
    , ((modm .|. shiftMask, xK_c      ), kill)                               -- Close focused window
    , ((modm,               xK_space  ), sendMessage NextLayout)             -- Rotate through the available layout algorithms
    , ((modm .|. shiftMask, xK_space  ), setLayout $ XMonad.layoutHook conf) -- Reset the layouts on the current workspace to default
    , ((modm,               xK_n      ), refresh)                            -- Resize viewed windows to the correct size
    , ((modm,               xK_Tab    ), windows W.focusDown)                -- Move focus to the next window
    , ((modm,               xK_j      ), windows W.focusDown)                -- Move focus to the next window
    , ((modm,               xK_k      ), windows W.focusUp)                  -- Move focus to the previous window
    , ((modm,               xK_m      ), windows W.focusMaster)              -- Move focus to the master window
    , ((modm,               xK_Return ), windows W.swapMaster)               -- Swap the focused window and the master window
    , ((modm .|. shiftMask, xK_j      ), windows W.swapDown)                 -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_k      ), windows W.swapUp)                   -- Swap the focused window with the previous window
    , ((modm,               xK_h      ), sendMessage Shrink)                 -- Shrink the master area
    , ((modm,               xK_l      ), sendMessage Expand)                 -- Expand the master area
    , ((modm,               xK_t      ), withFocused $ windows . W.sink)     -- Push window back into tiling
    , ((modm,               xK_comma  ), sendMessage (IncMasterN 1))         -- Increment the number of windows in the master area
    , ((modm,               xK_period ), sendMessage (IncMasterN (-1)))      -- Deincrement the number of windows in the master area
    , ((modm,               xK_b      ), sendMessage ToggleStruts)           -- Toggle the status bar gap
    , ((modm .|. shiftMask, xK_q      ), io (exitWith ExitSuccess))          -- Quit xmonad
    , ((modm,               xK_q      ), spawn "killall conky dzen2; xmonad --recompile; xmonad --restart") -- Restart xmonad
    -- Program shortcuts
    {-, ((modm .|. shiftMask, xK_b      ), spawn "firefox")-}
    , ((modm .|. shiftMask, xK_b      ), spawn "firefox")
    , ((modm .|. shiftMask, xK_f      ), spawn "thunar")
    , ((modm .|. shiftMask, xK_g      ), spawn "gvim")
    , ((modm .|. shiftMask, xK_m      ), spawn "quodlibet")
    , ((modm .|. shiftMask, xK_Print  ), spawn "scrot '/home/miles/media/image/screenshots/%F_%T_%N.png'")
    , ((0, xF86XK_AudioLowerVolume), spawn "amixer -q sset Master 2- unmute")
    , ((0, xF86XK_AudioMute       ), spawn "amixer -q sset Master toggle")
    , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -q sset Master 2+ unmute")
    ]
    ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w >> windows W.shiftMaster))
    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w >> windows W.shiftMaster))
    ]

-------------------------------------------------------------------------------
-- Helper Functions                                                          --
-------------------------------------------------------------------------------
conkyColor :: String -> String -> String -> String
conkyColor fg bg s = "^fg(\\\\" ++ fg ++ ")^bg(\\\\" ++ bg ++ ")" ++ s ++ "^bg()^fg()"

dzenIcon :: String -> String
dzenIcon i = "^i(" ++ myIconDir ++ i ++ ")"

dzenFont :: String -> String
dzenFont f = "-fn '" ++ f ++ "'"

dzenColorFg :: String -> String
dzenColorFg c = "-fg '" ++ c ++ "'"

dzenColorBg :: String -> String
dzenColorBg c = "-bg '" ++ c ++ "'"

dzenSizeY :: Int -> String
dzenSizeY n = "-h '" ++ show n ++ "'"

dzenSizeX :: Int -> String
dzenSizeX n = "-w '" ++ show n ++ "'"

dzenTextAlign :: String -> String
dzenTextAlign a = "-ta '" ++ [head a] ++ "'"

dzenPosX :: Int -> String
dzenPosX x = "-x '" ++ show x ++ "'"

dzenPosY :: Int -> String
dzenPosY y = "-y '" ++ show y ++ "'"

trimString :: String -> String
trimString s
    | length s > maxLen = take maxLen s ++ "..."
    | otherwise         = s
    where
        maxLen = 115

-------------------------------------------------------------------------------
-- Hooks                                                                     --
-------------------------------------------------------------------------------
myEventHook = mempty

myLayoutHook = avoidStruts $ tiled ||| Mirror tiled ||| Full -- ||| simpleFloat
    where tiled   = ResizableTall nmaster delta ratio []
          nmaster = 1
          delta   = 2/100
          ratio   = 1/2

-- Determines how XMonad status information is displayed
myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ defaultPP
    { ppCurrent         = dzenColor myWsColorFgCurrent     myWsColorBgCurrent     . wsIcon
    , ppVisible         = dzenColor myWsColorFgVisible     myWsColorBgVisible     . wsIcon
    , ppHidden          = dzenColor myWsColorFgHidden      myWsColorBgHidden      . wsIcon
    , ppHiddenNoWindows = dzenColor myWsColorFgHiddenEmpty myWsColorBgHiddenEmpty . wsIcon
    , ppUrgent          = dzenColor myWsColorFgUrgent      myWsColorBgUrgent      . wsIcon
    , ppWsSep           = ""
    , ppSep             = ""
    , ppLayout          = dzenColor myDzenColorFg myDzenColorBg .
                          (\x -> case x of
                              "ResizableTall"        -> "[" ++ (pad $ dzenIcon "layout01.xbm") ++ "]"
                              "Mirror ResizableTall" -> "[" ++ (pad $ dzenIcon "layout02.xbm") ++ "]"
                              "Full"                 -> "[" ++ (pad $ dzenIcon "layout03.xbm") ++ "]"
                              "Simple Float"         -> "[" ++ (pad $ dzenIcon "layout04.xbm") ++ "]"
                              _                      -> "[" ++ (pad $ dzenIcon "layout05.xbm") ++ "]" -- catch-all
                          )
    , ppTitle           = pad . trimString . dzenColor myDzenColorFg myDzenColorBg
    , ppOutput          = hPutStrLn h
    }
    where wsIcon = (\x -> case x of
                       "1" -> pad $ dzenIcon "terminal.xbm"
                       "2" -> pad $ dzenIcon "fox.xbm"
                       "3" -> pad $ dzenIcon "wrench.xbm"
                       "4" -> pad $ dzenIcon "file1.xbm"
                       "5" -> pad $ dzenIcon "tv.xbm"
                       "6" -> pad $ dzenIcon "pc.xbm"
                       "7" -> pad $ dzenIcon "clip.xbm"
                       "8" -> pad $ dzenIcon "balloon.xbm"
                       "9" -> pad $ dzenIcon "trash.xbm"
                       _   -> pad $ "?"
                   )

myStartupHook = setWMName "LG3D"

myManageHook :: ManageHook
myManageHook = (composeAll . concat $
    [ [className =? c --> doCenterFloat | c <- myFloats]
    , [className =? c --> doShift "2"   | c <- myWebs  ]
    , [className =? c --> doShift "3"   | c <- myDevs  ]
    , [className =? c --> doShift "4"   | c <- myFiles ]
    , [className =? c --> doShift "5"   | c <- myMedia ]
    , [className =? c --> doShift "6"   | c <- myVMs   ]
    , [className =? c --> doShift "7"   | c <- myOffice]
    , [className =? c --> doShift "9"   | c <- myEtc   ]
    ])
    where myFloats = ["Download"]
          myWebs   = ["Firefox"]
          myFiles  = ["Thunar"]
          myDevs   = ["Gvim", "Eclipse", "Java"]
          myMedia  = ["Quodlibet", "Gimp"]
          myVMs    = ["VirtualBox"]
          myOffice = ["libreoffice-startcenter"]
          myEtc    = ["Transmission-gtk"]

-------------------------------------------------------------------------------
-- Status Bar                                                                --
-------------------------------------------------------------------------------
conkyBar :: String -> String -> String -> String
conkyBar a b c = "conky --config='" ++ a ++ "' --text='" ++ b ++ " ' | dzen2 -e - " ++ c

myStatusBar = conkyBar myConkyConfig myConkyText statusBarDzenOpts
myXmonadBar = "dzen2 -e - " ++ xmonadBarDzenOpts

myConkyConfig = "/home/miles/.xmonad/conkyrc"

topBarConkyText = "${time " ++ myDateFormat ++ "}"

myConkyObjects :: [(String, String)]
myConkyObjects =
    [ (dzenIcon "cpu.xbm",         myConkyCpuMsg)
    , (dzenIcon "memory.xbm",      myConkyMemMsg)
    , (dzenIcon "diskette.xbm",    myConkyFsMsg )
    , (dzenIcon "spkr_01.xbm",     myConkyVolMsg)
    , (dzenIcon "bat_full_01.xbm", myConkyBatMsg)
    , (dzenIcon "wifi.xbm",        myConkyNetMsg)
    , (dzenIcon "clock2.xbm",      topBarConkyText)
    ]

{-myWirelessInterface = "wlp2s0"-}
myWirelessInterface = "wlp0s29u1u2"

myConkyBatMsg = "${if_match ${updates} <= 20}(?)${else}${if_match ${battery_percent BAT0} > 10}${battery_percent BAT0}%${else}${blink ${battery_percent BAT0}%}${endif}${endif}"
myConkyCpuMsg = "${cpu cpu1}% ${cpu cpu2}% ${cpu cpu3}% ${cpu cpu4}%"
myConkyFsMsg  = "${fs_used_perc /}% ${fs_used_perc /home}%"
myConkyMemMsg = "${if_match \"${swap}\" == \"0B\"}${memperc}%${else}${memperc}%${endif}"
myConkyNetMsg = "${if_up " ++ myWirelessInterface ++ "}${wireless_essid " ++ myWirelessInterface ++ "}${else}[n/a]${endif}"
myConkyVolMsg = "${if_mixer_mute Vol}off${else}${mixer Vol}%${endif}"

myConkyText = unwords [(conkyColor myAccentColor myDzenColorBg $ fst x) ++ " " ++ snd x | x <- myConkyObjects]

xmonadBarDzenOpts = unwords
    [ dzenColorBg   myDzenColorBg
    , dzenColorFg   myDzenColorFg
    , dzenFont      myBarFont
    , dzenPosX      0
    , dzenPosY      0
    , dzenSizeX $   myScreenWidth - myStatusBarWidth
    , dzenSizeY     myBarHeight
    , dzenTextAlign "left"
    ]

statusBarDzenOpts = unwords
    [ dzenColorBg   myDzenColorBg
    , dzenColorFg   myDzenColorFg
    , dzenFont      myBarFont
    , dzenPosX $    myScreenWidth - myStatusBarWidth
    , dzenPosY      0
    , dzenSizeX     myStatusBarWidth
    , dzenSizeY     myBarHeight
    , dzenTextAlign "right"
    ]

-- vim:fdm=marker
