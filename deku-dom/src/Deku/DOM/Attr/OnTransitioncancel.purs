module Deku.DOM.Attr.OnTransitioncancel where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnTransitioncancel = OnTransitioncancel

instance Deku.Attribute.Attr everything OnTransitioncancel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "transitioncancel", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnTransitioncancel
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "transitioncancel", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnTransitioncancelEffect =
  forall element
   . Deku.Attribute.Attr element OnTransitioncancel (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnTransitioncancel Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "transitioncancel", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnTransitioncancel (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "transitioncancel", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
