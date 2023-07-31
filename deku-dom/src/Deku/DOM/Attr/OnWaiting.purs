module Deku.DOM.Attr.OnWaiting where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnWaiting = OnWaiting

instance Deku.Attribute.Attr everything OnWaiting Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onwaiting", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnWaiting
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onwaiting", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnWaitingEffect =
  forall element
   . Deku.Attribute.Attr element OnWaiting (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnWaiting Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onwaiting", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnWaiting (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onwaiting", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
