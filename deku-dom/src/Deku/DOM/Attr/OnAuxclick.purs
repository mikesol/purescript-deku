module Deku.DOM.Attr.OnAuxclick where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnAuxclick = OnAuxclick

instance Deku.Attribute.Attr everything OnAuxclick Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "auxclick", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnAuxclick
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "auxclick", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnAuxclickEffect =
  forall element
   . Deku.Attribute.Attr element OnAuxclick (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnAuxclick Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "auxclick", value: _ } <<< Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnAuxclick (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "auxclick", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
