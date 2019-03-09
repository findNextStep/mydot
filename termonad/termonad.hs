{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Colour.SRGB (Colour, sRGB24)
import Termonad.App (defaultMain)
import Termonad.Config.Vec (Vec((:*), EmptyVec), N8, unsafeFromListVec_)
import Termonad.Config.Colour
  ( Colour, ColourConfig, Palette(ExtendedPalette), addColourExtension
  , createColourExtension, cursorBgColour, defaultColourConfig, foregroundColour
  , palette, sRGB24
  )
import Termonad.Config
  ( FontConfig, FontSize(FontSizePoints), Option(Set)
  , ShowScrollbar(ShowScrollbarAlways), defaultConfigOptions, defaultFontConfig
  , defaultTMConfig, fontConfig, fontFamily, fontSize, options, showScrollbar
  , scrollbackLen, confirmExit, wordCharExceptions, showMenu, showTabBar
  , cursorBlinkMode,CursorBlinkMode(..)
  )
import Termonad.Types
    ( ShowScrollbar(..), ShowTabBar(..)
    )
import Termonad.Config.Colour
  ( addColourExtension, createColourExtension, cursorBgColour, ColourConfig(..)
  , defaultColourConfig, palette, foregroundColour, backgroundColour
  )

-- | This sets the colors used for the terminal.  We only specify the background
-- color of the cursor.
colConf :: ColourConfig (Colour Double)
colConf = defaultColourConfig
    { cursorFgColour = Set $ sRGB24 0 0 0
    , cursorBgColour = Set $ sRGB24 204 204 204
    , backgroundColour = sRGB24 38 38 38
    , foregroundColour = sRGB24 255 255 255
    , palette = ExtendedPalette mycolor1 mycolor2
    }
  where
    mycolor1 :: Vec N8 (Colour Double)
    mycolor1 =
         sRGB24  38  38  38 -- base03, background
      :* sRGB24 205   0   0 -- red
      :* sRGB24   0 205   0 -- green
      :* sRGB24 205  85   0 -- yellow
      :* sRGB24   0   0 205 -- blue
      :* sRGB24 205   0 205 -- magenta
      :* sRGB24   0 205 205 -- cyan
      :* sRGB24 250 235 215 -- base2
      :* EmptyVec

    mycolor2 :: Vec N8 (Colour Double)
    mycolor2 =
         sRGB24  64  64  64-- base02, background highlights
      :* sRGB24 255   0   0 -- orange
      :* sRGB24   0 255   0 -- base01, comments / secondary text
      :* sRGB24 255 255   0 -- base0, body text / default code / primary content
      :* sRGB24   0   0 255 -- base1, optional emphasised content
      :* sRGB24 255   0 255 -- violet
      :* sRGB24   0 255 255 -- base00
      :* sRGB24 255 255 255 -- base3
      :* EmptyVec

-- | This defines the font for the terminal.
fontConf :: FontConfig
fontConf =
  defaultFontConfig
    { fontFamily = "DroidSansMono Nerd Font"
    , fontSize = FontSizePoints 13
    }

main :: IO ()
main = do
  colExt <- createColourExtension colConf
  let termonadConf =
        defaultTMConfig
          { options =
              defaultConfigOptions
                { fontConfig = fontConf
                , showScrollbar = ShowScrollbarIfNeeded
                , scrollbackLen = 10000
                , confirmExit = False
                , wordCharExceptions = "-#%&+,./=?@\\_~\183:"
                , showMenu = False
                , showTabBar = ShowTabBarIfNeeded
                , cursorBlinkMode = CursorBlinkModeOn
                }
          }
        `addColourExtension` colExt
  defaultMain termonadConf
