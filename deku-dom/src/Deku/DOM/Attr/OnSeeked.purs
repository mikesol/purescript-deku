module Deku.DOM.Attr.OnSeeked where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnSeeked = OnSeeked

instance Deku.Attribute.Attr everything OnSeeked Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onseeked", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnSeeked
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onseeked", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnSeekedEffect =
  forall element
   . Deku.Attribute.Attr element OnSeeked (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnSeeked Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onseeked", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnSeeked (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onseeked", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
