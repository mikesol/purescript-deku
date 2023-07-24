module Deku.DOM.Attr.OnToggle where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnToggle = OnToggle

instance Deku.Attribute.Attr everything OnToggle Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onToggle", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnToggle
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onToggle", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnToggleEffect =
  forall element
   . Deku.Attribute.Attr element OnToggle (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnToggle Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onToggle", value: _ } <<< Deku.Attribute.cb'
