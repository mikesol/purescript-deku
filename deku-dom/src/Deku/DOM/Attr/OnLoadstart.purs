module Deku.DOM.Attr.OnLoadstart where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnLoadstart = OnLoadstart

instance Deku.Attribute.Attr everything OnLoadstart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onloadstart", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnLoadstart
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onloadstart", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnLoadstartEffect =
  forall element
   . Deku.Attribute.Attr element OnLoadstart (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnLoadstart Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onloadstart", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnLoadstart (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onloadstart", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
