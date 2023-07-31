module Deku.DOM.Attr.OnDragover where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnDragover = OnDragover

instance Deku.Attribute.Attr everything OnDragover Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "ondragover", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnDragover
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondragover", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnDragoverEffect =
  forall element
   . Deku.Attribute.Attr element OnDragover (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnDragover Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondragover", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnDragover (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "ondragover", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
