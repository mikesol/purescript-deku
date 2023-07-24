module Deku.DOM.Attr.OnWheel where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnWheel = OnWheel

instance Deku.Attribute.Attr everything OnWheel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onWheel", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnWheel
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onWheel", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnWheelEffect =
  forall element
   . Deku.Attribute.Attr element OnWheel (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnWheel Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onWheel", value: _ } <<< Deku.Attribute.cb'
