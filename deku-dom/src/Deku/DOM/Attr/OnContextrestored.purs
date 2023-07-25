module Deku.DOM.Attr.OnContextrestored where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnContextrestored = OnContextrestored

instance Deku.Attribute.Attr everything OnContextrestored Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "oncontextrestored", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnContextrestored
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "oncontextrestored", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnContextrestoredEffect =
  forall element
   . Deku.Attribute.Attr element OnContextrestored (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnContextrestored Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "oncontextrestored", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnContextrestored (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "oncontextrestored", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
