module Deku.DOM.Attr.OnContextlost where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnContextlost = OnContextlost

instance Deku.Attribute.Attr everything OnContextlost Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "oncontextlost", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnContextlost
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "oncontextlost", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnContextlostEffect =
  forall element
   . Deku.Attribute.Attr element OnContextlost (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnContextlost Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "oncontextlost", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnContextlost (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "oncontextlost", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
