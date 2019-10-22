import XMonad
import XMonad.Config.Desktop
import XMonad.Layout.BinarySpacePartition
import XMonad.Layout.SimpleFloat
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Spacing
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.WallpaperSetter
import XMonad.Actions.CycleWS
import Control.Monad
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import System.IO

keysToAdd x =
    [
        ((modMask x, xK_Down),  nextWS),
        ((modMask x, xK_Up),    prevWS),
        ((modMask x .|. shiftMask, xK_l),     spawn "slock"),
        ((modMask x , xK_b),    sendMessage ToggleStruts),
        ((modMask x , xK_p),    spawn "dmenu_fix")
    ]

myKeys x = M.union (M.fromList (keysToAdd x)) (keys defaultConfig x)

myTerminal = "termite -e 'tmux new-session -A'"

myWorkspaces = ["1","2","3","4","5","6"]

myWallpapers = wallpaperSetter defWallpaperConf

myLayouts = smartSpacing 7 $ tiled ||| Mirror tiled ||| simpleFloat ||| Full ||| emptyBSP
    where
        tiled = Tall nmaster delta ratio
        nmaster = 1
        ratio = 2/3
        delta = 3/100


main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ docks defaultConfig {
        terminal   = myTerminal,
        modMask    = mod4Mask,
        workspaces = myWorkspaces,
        manageHook = manageDocks,
        layoutHook = desktopLayoutModifiers $ myLayouts,
        logHook    = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc,
                          ppTitle = xmobarColor "green" "" . shorten 50
                        } <> myWallpapers,
        keys       = myKeys
    }
