module Deku.DOM.Attr.OnCuechange where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event

data OnCuechange = OnCuechange

instance Deku.Attribute.Attr everything OnCuechange Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onCuechange", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnCuechange
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onCuechange", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnCuechangeEffect =
  forall element
   . Deku.Attribute.Attr element OnCuechange (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnCuechange Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onCuechange", value: _ } <<<
    Deku.Attribute.cb'
