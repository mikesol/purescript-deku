module Deku.DOM.Attr.OnSlotchange where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnSlotchange = OnSlotchange

instance Deku.Attribute.Attr everything OnSlotchange Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onslotchange", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnSlotchange
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onslotchange", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnSlotchangeEffect =
  forall element
   . Deku.Attribute.Attr element OnSlotchange (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnSlotchange Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onslotchange", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnSlotchange (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onslotchange", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
