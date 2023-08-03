module Deku.DOM.Attr.OnFocus where

import Data.Tuple as Tuple
import Control.Monad.ST as ST
import Control.Monad.ST.Global as Global
import Data.Functor.Product as Product
import Prelude
import Data.These (These(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnFocus = OnFocus

instance Attr anything OnFocus (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnFocus bothValues = unsafeAttribute $ Both (pure 
    { key: "focus", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "focus", value: cb' value })
instance Attr anything OnFocus (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnFocus (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "focus", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "focus", value: cb' value })
instance Attr anything OnFocus  Cb  where
  attr OnFocus value = unsafeAttribute $ This $ pure $
    { key: "focus", value: cb' value }
instance Attr anything OnFocus (Event.Event  Cb ) where
  attr OnFocus eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "focus", value: cb' value }

instance Attr anything OnFocus (ST.ST Global.Global  Cb ) where
  attr OnFocus stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "focus", value: cb' value }

instance Attr anything OnFocus (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnFocus bothValues = unsafeAttribute $ Both (pure 
    { key: "focus", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "focus", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnFocus (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnFocus (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "focus", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "focus", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnFocus  (Effect Unit)  where
  attr OnFocus value = unsafeAttribute $ This $ pure $
    { key: "focus", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnFocus (Event.Event  (Effect Unit) ) where
  attr OnFocus eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "focus", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnFocus (ST.ST Global.Global  (Effect Unit) ) where
  attr OnFocus stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "focus", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnFocus (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnFocus bothValues = unsafeAttribute $ Both (pure 
    { key: "focus", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "focus", value: cb' (Cb (const value)) }
    )
instance Attr anything OnFocus (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnFocus (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "focus", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "focus", value: cb' (Cb (const value)) }
    )
instance Attr anything OnFocus  (Effect Boolean)  where
  attr OnFocus value = unsafeAttribute $ This $ pure $
    { key: "focus", value: cb' (Cb (const value)) }
instance Attr anything OnFocus (Event.Event  (Effect Boolean) ) where
  attr OnFocus eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "focus", value: cb' (Cb (const value)) }

instance Attr anything OnFocus (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnFocus stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "focus", value: cb' (Cb (const value)) }

instance Attr everything OnFocus (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnFocus bothValues = unsafeAttribute $ Both (pure 
    { key: "focus", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "focus", value: unset' })
instance Attr everything OnFocus (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnFocus (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "focus", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "focus", value: unset' })
instance Attr everything OnFocus  Unit  where
  attr OnFocus _ = unsafeAttribute $ This $ pure $ { key: "focus", value: unset' }
instance Attr everything OnFocus (Event.Event  Unit ) where
  attr OnFocus eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "focus", value: unset' }

instance Attr everything OnFocus (ST.ST Global.Global  Unit ) where
  attr OnFocus stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "focus", value: unset' }
