module Deku.DOM.Attr.OnMouseleave where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Data.Unit as Data.Unit
import Deku.Attribute as Deku.Attribute
import FRP.Event as FRP.Event
import Data.Function (const)

data OnMouseleave = OnMouseleave

instance Deku.Attribute.Attr everything OnMouseleave Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onmouseleave", value: Deku.Attribute.unset' }

instance
  Deku.Attribute.Attr everything
    OnMouseleave
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onmouseleave", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

type OnMouseleaveEffect =
  forall element
   . Deku.Attribute.Attr element OnMouseleave (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance Deku.Attribute.Attr everything OnMouseleave Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onmouseleave", value: _ } <<<
    Deku.Attribute.cb'

instance Deku.Attribute.Attr everything OnMouseleave (Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onmouseleave", value: _ }
    <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb
    <<< const
