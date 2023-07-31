module Deku.DOM.Attr.OnStalled where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnStalled = OnStalled

instance Deku.Attribute.Attr everything OnStalled Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onstalled", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnStalled
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onstalled", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnStalledEffect =
  forall element
   . Deku.Attribute.Attr element OnStalled (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnStalled Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onstalled", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnStalled (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onstalled", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
