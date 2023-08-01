module Deku.DOM.Attr.OnPointermove where

import Prelude
import Data.These (These(..))
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointermove = OnPointermove

instance Attr anything OnPointermove Cb where
  attr OnPointermove bothValues = unsafeAttribute $ Both
    { key: "pointermove", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "pointermove", value: cb' value })
  pureAttr OnPointermove value = unsafeAttribute $ This
    { key: "pointermove", value: cb' value }
  unpureAttr OnPointermove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointermove", value: cb' value }

instance Attr anything OnPointermove (Effect Unit) where
  attr OnPointermove bothValues = unsafeAttribute $ Both
    { key: "pointermove", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointermove", value: cb' (Cb (const (value $> true))) }
    )
  pureAttr OnPointermove value = unsafeAttribute $ This
    { key: "pointermove", value: cb' (Cb (const (value $> true))) }
  unpureAttr OnPointermove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointermove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointermove (Effect Boolean) where
  attr OnPointermove bothValues = unsafeAttribute $ Both
    { key: "pointermove", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "pointermove", value: cb' (Cb (const value)) }
    )
  pureAttr OnPointermove value = unsafeAttribute $ This
    { key: "pointermove", value: cb' (Cb (const value)) }
  unpureAttr OnPointermove eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "pointermove", value: cb' (Cb (const value)) }

type OnPointermoveEffect =
  forall element
   . Attr element OnPointermove (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointermove Unit where
  attr OnPointermove bothValues = unsafeAttribute $ Both
    { key: "pointermove", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "pointermove", value: unset' })
  pureAttr OnPointermove _ = unsafeAttribute $ This
    { key: "pointermove", value: unset' }
  unpureAttr OnPointermove eventValue = unsafeAttribute $ That $ eventValue <#>
    \_ -> { key: "pointermove", value: unset' }
