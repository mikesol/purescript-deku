module Deku.DOM.Attr.OnAnimationstart where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnAnimationstart = OnAnimationstart

instance Deku.Attribute.Attr everything OnAnimationstart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "onAnimationstart", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnAnimationstart
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onAnimationstart", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnAnimationstartEffect =
  forall element
   . Deku.Attribute.Attr element OnAnimationstart (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnAnimationstart Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onAnimationstart", value: _ } <<<
    Deku.Attribute.cb'
