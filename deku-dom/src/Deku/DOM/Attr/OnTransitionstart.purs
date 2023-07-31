module Deku.DOM.Attr.OnTransitionstart where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnTransitionstart = OnTransitionstart

instance Deku.Attribute.Attr everything OnTransitionstart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "ontransitionstart", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnTransitionstart
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ontransitionstart", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnTransitionstartEffect =
  forall element
   . Deku.Attribute.Attr element OnTransitionstart (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnTransitionstart Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ontransitionstart", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnTransitionstart (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ontransitionstart", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
