module Deku.DOM.Attr.OnKeydown where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnKeydown = OnKeydown

instance Deku.Attribute.Attr everything OnKeydown Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "keydown", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnKeydown
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keydown", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnKeydownEffect =
  forall element
   . Deku.Attribute.Attr element OnKeydown (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnKeydown Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keydown", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnKeydown (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keydown", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
