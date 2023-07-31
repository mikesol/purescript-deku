module Deku.DOM.Attr.OnRatechange where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnRatechange = OnRatechange

instance Deku.Attribute.Attr everything OnRatechange Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "ratechange", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnRatechange
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ratechange", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnRatechangeEffect =
  forall element
   . Deku.Attribute.Attr element OnRatechange (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnRatechange Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ratechange", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnRatechange (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ratechange", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
