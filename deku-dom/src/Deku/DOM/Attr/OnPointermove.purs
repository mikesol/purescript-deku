module Deku.DOM.Attr.OnPointermove where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnPointermove = OnPointermove

instance Deku.Attribute.Attr everything OnPointermove Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pointermove", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnPointermove
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointermove", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnPointermoveEffect =
  forall element
   . Deku.Attribute.Attr element OnPointermove (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnPointermove Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointermove", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnPointermove (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointermove", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
