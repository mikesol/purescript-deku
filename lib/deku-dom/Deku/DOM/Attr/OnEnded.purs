module Deku.DOM.Attr.OnEnded where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnEnded = OnEnded

instance Deku.Attribute.Attr everything OnEnded Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onEnded", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnEnded
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onEnded", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnEndedEffect =
  forall element
   . Deku.Attribute.Attr element OnEnded (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnEnded Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onEnded", value: _ } <<< Deku.Attribute.cb'
