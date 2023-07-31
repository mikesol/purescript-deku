module Deku.DOM.Attr.OnSelect where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnSelect = OnSelect

instance Deku.Attribute.Attr everything OnSelect Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "select", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnSelect
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "select", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

type OnSelectEffect =
  forall element
   . Deku.Attribute.Attr element OnSelect (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnSelect Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "select", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnSelect (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "select", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
