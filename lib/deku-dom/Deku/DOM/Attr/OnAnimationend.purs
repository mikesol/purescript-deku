module Deku.DOM.Attr.OnAnimationend where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnAnimationend = OnAnimationend

instance Deku.Attribute.Attr everything OnAnimationend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onAnimationend", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnAnimationend
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onAnimationend", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnAnimationendEffect =
  forall element
   . Deku.Attribute.Attr element OnAnimationend (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnAnimationend Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onAnimationend", value: _ } <<<
    Deku.Attribute.cb'
