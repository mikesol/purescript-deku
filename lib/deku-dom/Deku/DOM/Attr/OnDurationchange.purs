module Deku.DOM.Attr.OnDurationchange where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnDurationchange = OnDurationchange

instance Deku.Attribute.Attr everything OnDurationchange Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "onDurationchange", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnDurationchange
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onDurationchange", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnDurationchangeEffect =
  forall element
   . Deku.Attribute.Attr element OnDurationchange (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnDurationchange Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onDurationchange", value: _ } <<<
    Deku.Attribute.cb'
