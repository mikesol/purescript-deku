module Deku.DOM.Attr.OnReset where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnReset = OnReset

instance Deku.Attribute.Attr everything OnReset Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "reset", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnReset
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "reset", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnResetEffect =
  forall element
   . Deku.Attribute.Attr element OnReset (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnReset Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "reset", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnReset (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "reset", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
