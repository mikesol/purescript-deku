module Deku.DOM.Attr.OnTransitioncancel where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnTransitioncancel = OnTransitioncancel

instance Deku.Attribute.Attr everything OnTransitioncancel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "onTransitioncancel", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnTransitioncancel
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onTransitioncancel", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnTransitioncancelEffect =
  forall element
   . Deku.Attribute.Attr element OnTransitioncancel (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnTransitioncancel Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onTransitioncancel", value: _ } <<<
    Deku.Attribute.cb'
