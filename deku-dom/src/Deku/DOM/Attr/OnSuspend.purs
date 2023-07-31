module Deku.DOM.Attr.OnSuspend where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnSuspend = OnSuspend

instance Deku.Attribute.Attr everything OnSuspend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "suspend", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnSuspend
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "suspend", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnSuspendEffect =
  forall element
   . Deku.Attribute.Attr element OnSuspend (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnSuspend Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "suspend", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnSuspend (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "suspend", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
