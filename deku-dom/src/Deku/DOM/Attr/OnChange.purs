module Deku.DOM.Attr.OnChange where

import Control.Semigroupoid ((<<<))
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnChange = OnChange

instance Deku.Attribute.Attr everything OnChange Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onchange", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnChange
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onchange", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnChangeEffect =
  forall element
   . Deku.Attribute.Attr element OnChange (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnChange Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onchange", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnChange (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onchange", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
