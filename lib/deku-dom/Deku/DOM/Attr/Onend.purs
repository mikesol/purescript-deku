module Deku.DOM.Attr.Onend where

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

data Onend = Onend

instance Deku.Attribute.Attr everything Onend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "onend", value: Deku.Attribute.unset' }

type OnendEffect =
  forall element
   . Deku.Attribute.Attr element Onend (Effect.Effect Data.Unit.Unit)
  => FRP.Event.Event (Deku.Attribute.Attribute element)

instance
  Deku.Attribute.Attr Animate_
    Onend
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

instance Deku.Attribute.Attr Animate_ Onend Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb'

instance
  Deku.Attribute.Attr AnimateMotion_
    Onend
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

instance Deku.Attribute.Attr AnimateMotion_ Onend Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb'

instance
  Deku.Attribute.Attr AnimateTransform_
    Onend
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

instance Deku.Attribute.Attr AnimateTransform_ Onend Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb'

instance
  Deku.Attribute.Attr Discard_
    Onend
    (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

instance Deku.Attribute.Attr Discard_ Onend Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb'

instance
  Deku.Attribute.Attr Set_ Onend (Web.Event.Internal.Types.Event -> Effect.Effect Data.Unit.Unit) where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb' <<<
    Deku.Attribute.cb

instance Deku.Attribute.Attr Set_ Onend Deku.Attribute.Cb where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "onend", value: _ } <<< Deku.Attribute.cb'
