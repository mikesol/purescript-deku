module Deku.DOM.Attr.OnTransitionend where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnTransitionend = OnTransitionend

instance Deku.Attribute.Attr everything OnTransitionend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "ontransitionend", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnTransitionend
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ontransitionend", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnTransitionendEffect =
  forall element
   . Deku.Attribute.Attr element OnTransitionend (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnTransitionend Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ontransitionend", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnTransitionend (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ontransitionend", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
