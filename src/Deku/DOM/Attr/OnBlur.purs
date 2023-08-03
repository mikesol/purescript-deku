module Deku.DOM.Attr.OnBlur where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnBlur = OnBlur

instance Attr anything OnBlur (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnBlur bothValues = unsafeAttribute $ Both
    { key: "blur", value: cb' (NonEmpty.head bothValues) }
    (NonEmpty.tail bothValues <#> \value -> { key: "blur", value: cb' value })
instance Attr anything OnBlur  Cb  where
  attr OnBlur value = unsafeAttribute $ This $ pure $
    { key: "blur", value: cb' value }
instance Attr anything OnBlur (Event.Event  Cb ) where
  attr OnBlur eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "blur", value: cb' value }

instance Attr anything OnBlur (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnBlur bothValues = unsafeAttribute $ Both
    { key: "blur", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "blur", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnBlur  (Effect Unit)  where
  attr OnBlur value = unsafeAttribute $ This $ pure $
    { key: "blur", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnBlur (Event.Event  (Effect Unit) ) where
  attr OnBlur eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "blur", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnBlur (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnBlur bothValues = unsafeAttribute $ Both
    { key: "blur", value: cb' (Cb (const (NonEmpty.head bothValues))) }
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "blur", value: cb' (Cb (const value)) }
    )
instance Attr anything OnBlur  (Effect Boolean)  where
  attr OnBlur value = unsafeAttribute $ This $ pure $
    { key: "blur", value: cb' (Cb (const value)) }
instance Attr anything OnBlur (Event.Event  (Effect Boolean) ) where
  attr OnBlur eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "blur", value: cb' (Cb (const value)) }

type OnBlurEffect =
  forall element. Attr element OnBlur (Effect Unit) => Event (Attribute element)

instance Attr everything OnBlur (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnBlur bothValues = unsafeAttribute $ Both { key: "blur", value: unset' }
    (NonEmpty.tail bothValues <#> \_ -> { key: "blur", value: unset' })
instance Attr everything OnBlur  Unit  where
  attr OnBlur _ = unsafeAttribute $ This $ pure $ { key: "blur", value: unset' }
instance Attr everything OnBlur (Event.Event  Unit ) where
  attr OnBlur eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "blur", value: unset' }
