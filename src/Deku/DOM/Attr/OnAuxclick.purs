module Deku.DOM.Attr.OnAuxclick where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAuxclick = OnAuxclick

instance Attr anything OnAuxclick (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnAuxclick bothValues = unsafeAttribute $ Both
    { key: "auxclick", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "auxclick", value: cb' value })
instance Attr anything OnAuxclick  Cb  where
  attr OnAuxclick value = unsafeAttribute $ This $ pure $
    { key: "auxclick", value: cb' value }
instance Attr anything OnAuxclick (Event.Event  Cb ) where
  attr OnAuxclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "auxclick", value: cb' value }

instance Attr anything OnAuxclick (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnAuxclick bothValues = unsafeAttribute $ Both
    { key: "auxclick", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "auxclick", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnAuxclick  (Effect Unit)  where
  attr OnAuxclick value = unsafeAttribute $ This $ pure $
    { key: "auxclick", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAuxclick (Event.Event  (Effect Unit) ) where
  attr OnAuxclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "auxclick", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAuxclick (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnAuxclick bothValues = unsafeAttribute $ Both
    { key: "auxclick", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "auxclick", value: cb' (Cb (const value)) }
    )
instance Attr anything OnAuxclick  (Effect Boolean)  where
  attr OnAuxclick value = unsafeAttribute $ This $ pure $
    { key: "auxclick", value: cb' (Cb (const value)) }
instance Attr anything OnAuxclick (Event.Event  (Effect Boolean) ) where
  attr OnAuxclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "auxclick", value: cb' (Cb (const value)) }

type OnAuxclickEffect =
  forall element
   . Attr element OnAuxclick (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAuxclick (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnAuxclick bothValues = unsafeAttribute $ Both
    { key: "auxclick", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "auxclick", value: unset' })
instance Attr everything OnAuxclick  Unit  where
  attr OnAuxclick _ = unsafeAttribute $ This $ pure $
    { key: "auxclick", value: unset' }
instance Attr everything OnAuxclick (Event.Event  Unit ) where
  attr OnAuxclick eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "auxclick", value: unset' }
