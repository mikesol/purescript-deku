module Deku.DOM.Attr.OnShow where

import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnShow = OnShow

instance Attr anything OnShow (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnShow bothValues = unsafeAttribute $ Both (pure 
    { key: "show", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "show", value: cb' value })
instance Attr anything OnShow  Cb  where
  attr OnShow value = unsafeAttribute $ This $ pure $
    { key: "show", value: cb' value }
instance Attr anything OnShow (Event.Event  Cb ) where
  attr OnShow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "show", value: cb' value }

instance Attr anything OnShow (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnShow bothValues = unsafeAttribute $ Both (pure 
    { key: "show", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "show", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnShow  (Effect Unit)  where
  attr OnShow value = unsafeAttribute $ This $ pure $
    { key: "show", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnShow (Event.Event  (Effect Unit) ) where
  attr OnShow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "show", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnShow (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnShow bothValues = unsafeAttribute $ Both (pure 
    { key: "show", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "show", value: cb' (Cb (const value)) }
    )
instance Attr anything OnShow  (Effect Boolean)  where
  attr OnShow value = unsafeAttribute $ This $ pure $
    { key: "show", value: cb' (Cb (const value)) }
instance Attr anything OnShow (Event.Event  (Effect Boolean) ) where
  attr OnShow eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "show", value: cb' (Cb (const value)) }

type OnShowEffect =
  forall element. Attr element OnShow (Effect Unit) => Event (Attribute element)

instance Attr everything OnShow (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnShow bothValues = unsafeAttribute $ Both (pure  { key: "show", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "show", value: unset' })
instance Attr everything OnShow  Unit  where
  attr OnShow _ = unsafeAttribute $ This $ pure $ { key: "show", value: unset' }
instance Attr everything OnShow (Event.Event  Unit ) where
  attr OnShow eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "show", value: unset' }
