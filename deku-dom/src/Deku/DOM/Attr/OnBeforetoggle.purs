module Deku.DOM.Attr.OnBeforetoggle where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnBeforetoggle = OnBeforetoggle

instance Deku.Attribute.Attr everything OnBeforetoggle Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "beforetoggle", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnBeforetoggle
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "beforetoggle", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnBeforetoggleEffect =
  forall element
   . Deku.Attribute.Attr element OnBeforetoggle (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnBeforetoggle Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "beforetoggle", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnBeforetoggle (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "beforetoggle", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
