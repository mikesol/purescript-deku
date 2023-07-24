module Deku.DOM.Attr.OnWebkittransitionend where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnWebkittransitionend = OnWebkittransitionend

instance Deku.Attribute.Attr everything OnWebkittransitionend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "onWebkittransitionend", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnWebkittransitionend
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onWebkittransitionend", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnWebkittransitionendEffect =
  forall element
   . Deku.Attribute.Attr element OnWebkittransitionend (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnWebkittransitionend Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onWebkittransitionend", value: _ } <<<
    Deku.Attribute.cb'
