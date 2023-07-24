module Deku.DOM.Attr.Onrepeat where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Effect as Effect
import Web.Event.Internal.Types as Web.Event.Internal.Types
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Animate (Animate_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.Discard (Discard_)
import Deku.DOM.Elt.Set (Set_)
import FRP.Event as FRP.Event

data Onrepeat = Onrepeat

instance Deku.Attribute.Attr everything Onrepeat Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onrepeat", value: Deku.Attribute.unset' }

type OnrepeatEffect =
  forall element
   . Deku.Attribute.Attr element Onrepeat (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance
  Deku.Attribute.Attr Animate_
    Onrepeat
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr Animate_ Onrepeat Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'

instance
  Deku.Attribute.Attr AnimateMotion_
    Onrepeat
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr AnimateMotion_ Onrepeat Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'

instance
  Deku.Attribute.Attr AnimateTransform_
    Onrepeat
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr AnimateTransform_ Onrepeat Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'

instance
  Deku.Attribute.Attr Discard_
    Onrepeat
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr Discard_ Onrepeat Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'

instance
  Deku.Attribute.Attr Set_ Onrepeat (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
    <<< Deku.Attribute.cb

instance Deku.Attribute.Attr Set_ Onrepeat Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onrepeat", value: _ } <<< Deku.Attribute.cb'
