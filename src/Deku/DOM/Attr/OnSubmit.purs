module Deku.DOM.Attr.OnSubmit where

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

data OnSubmit = OnSubmit

instance Attr anything OnSubmit (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnSubmit bothValues = unsafeAttribute $ Both (pure 
    { key: "submit", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "submit", value: cb' value })
instance Attr anything OnSubmit (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnSubmit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "submit", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "submit", value: cb' value })
instance Attr anything OnSubmit  Cb  where
  attr OnSubmit value = unsafeAttribute $ This $ pure $
    { key: "submit", value: cb' value }
instance Attr anything OnSubmit (Event.Event  Cb ) where
  attr OnSubmit eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "submit", value: cb' value }

instance Attr anything OnSubmit (ST.ST Global.Global  Cb ) where
  attr OnSubmit stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "submit", value: cb' value }

instance Attr anything OnSubmit (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnSubmit bothValues = unsafeAttribute $ Both (pure 
    { key: "submit", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "submit", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSubmit (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnSubmit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "submit", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "submit", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnSubmit  (Effect Unit)  where
  attr OnSubmit value = unsafeAttribute $ This $ pure $
    { key: "submit", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSubmit (Event.Event  (Effect Unit) ) where
  attr OnSubmit eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "submit", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSubmit (ST.ST Global.Global  (Effect Unit) ) where
  attr OnSubmit stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "submit", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSubmit (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnSubmit bothValues = unsafeAttribute $ Both (pure 
    { key: "submit", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "submit", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSubmit (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnSubmit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "submit", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "submit", value: cb' (Cb (const value)) }
    )
instance Attr anything OnSubmit  (Effect Boolean)  where
  attr OnSubmit value = unsafeAttribute $ This $ pure $
    { key: "submit", value: cb' (Cb (const value)) }
instance Attr anything OnSubmit (Event.Event  (Effect Boolean) ) where
  attr OnSubmit eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "submit", value: cb' (Cb (const value)) }

instance Attr anything OnSubmit (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnSubmit stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "submit", value: cb' (Cb (const value)) }

instance Attr everything OnSubmit (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnSubmit bothValues = unsafeAttribute $ Both (pure 
    { key: "submit", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "submit", value: unset' })
instance Attr everything OnSubmit (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnSubmit (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "submit", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "submit", value: unset' })
instance Attr everything OnSubmit  Unit  where
  attr OnSubmit _ = unsafeAttribute $ This $ pure $ { key: "submit", value: unset' }
instance Attr everything OnSubmit (Event.Event  Unit ) where
  attr OnSubmit eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "submit", value: unset' }

instance Attr everything OnSubmit (ST.ST Global.Global  Unit ) where
  attr OnSubmit stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "submit", value: unset' }
