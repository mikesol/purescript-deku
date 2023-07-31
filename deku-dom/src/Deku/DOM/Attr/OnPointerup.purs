module Deku.DOM.Attr.OnPointerup where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnPointerup = OnPointerup

instance Deku.Attribute.Attr everything OnPointerup Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onpointerup", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnPointerup
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onpointerup", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnPointerupEffect =
  forall element
   . Deku.Attribute.Attr element OnPointerup (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnPointerup Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onpointerup", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnPointerup (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onpointerup", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
