module Deku.DOM.Attr.OnSelectstart where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnSelectstart = OnSelectstart

instance Deku.Attribute.Attr everything OnSelectstart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onSelectstart", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnSelectstart
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onSelectstart", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnSelectstartEffect =
  forall element
   . Deku.Attribute.Attr element OnSelectstart (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnSelectstart Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onSelectstart", value: _ } <<<
    Deku.Attribute.cb'
