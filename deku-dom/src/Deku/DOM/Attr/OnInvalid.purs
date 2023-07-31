module Deku.DOM.Attr.OnInvalid where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnInvalid = OnInvalid

instance Deku.Attribute.Attr everything OnInvalid Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "invalid", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnInvalid
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "invalid", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnInvalidEffect =
  forall element
   . Deku.Attribute.Attr element OnInvalid (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnInvalid Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "invalid", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnInvalid (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "invalid", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
