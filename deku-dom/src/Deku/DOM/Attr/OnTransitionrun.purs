module Deku.DOM.Attr.OnTransitionrun where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnTransitionrun = OnTransitionrun

instance Deku.Attribute.Attr everything OnTransitionrun Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "ontransitionrun", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnTransitionrun
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ontransitionrun", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnTransitionrunEffect =
  forall element
   . Deku.Attribute.Attr element OnTransitionrun (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnTransitionrun Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ontransitionrun", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnTransitionrun (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ontransitionrun", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
