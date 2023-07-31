module Deku.DOM.Attr.OnError where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnError = OnError

instance Deku.Attribute.Attr everything OnError Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "error", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnError
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "error", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnErrorEffect =
  forall element
   . Deku.Attribute.Attr element OnError (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnError Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "error", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnError (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "error", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
