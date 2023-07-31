module Deku.DOM.Attr.OnDragstart where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnDragstart = OnDragstart

instance Deku.Attribute.Attr everything OnDragstart Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "dragstart", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnDragstart
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dragstart", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnDragstartEffect =
  forall element
   . Deku.Attribute.Attr element OnDragstart (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnDragstart Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dragstart", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnDragstart (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dragstart", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
