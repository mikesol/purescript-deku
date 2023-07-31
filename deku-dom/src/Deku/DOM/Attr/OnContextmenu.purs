module Deku.DOM.Attr.OnContextmenu where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnContextmenu = OnContextmenu

instance Deku.Attribute.Attr everything OnContextmenu Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "contextmenu", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnContextmenu
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "contextmenu", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnContextmenuEffect =
  forall element
   . Deku.Attribute.Attr element OnContextmenu (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnContextmenu Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "contextmenu", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnContextmenu (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "contextmenu", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
