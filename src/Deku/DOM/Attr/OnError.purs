module Deku.DOM.Attr.OnError where

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

data OnError = OnError

instance Attr anything OnError (NonEmpty.NonEmpty Event.Event  Cb ) where
  attr OnError bothValues = unsafeAttribute $ Both (pure 
    { key: "error", value: cb' (NonEmpty.head bothValues) })
    (NonEmpty.tail bothValues <#> \value -> { key: "error", value: cb' value })
instance Attr anything OnError (Product.Product (ST.ST Global.Global) Event.Event  Cb ) where
  attr OnError (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "error", value: cb' (value) })
    (Tuple.snd bothValues <#> \value -> { key: "error", value: cb' value })
instance Attr anything OnError  Cb  where
  attr OnError value = unsafeAttribute $ This $ pure $
    { key: "error", value: cb' value }
instance Attr anything OnError (Event.Event  Cb ) where
  attr OnError eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "error", value: cb' value }

instance Attr anything OnError (ST.ST Global.Global  Cb ) where
  attr OnError stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "error", value: cb' value }

instance Attr anything OnError (NonEmpty.NonEmpty Event.Event  (Effect Unit) ) where
  attr OnError bothValues = unsafeAttribute $ Both (pure 
    { key: "error", value: cb' (Cb (const ((NonEmpty.head bothValues) $> true))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "error", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnError (Product.Product (ST.ST Global.Global) Event.Event  (Effect Unit) ) where
  attr OnError (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "error", value: cb' (Cb (const ((value) $> true))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "error", value: cb' (Cb (const (value $> true))) }
    )
instance Attr anything OnError  (Effect Unit)  where
  attr OnError value = unsafeAttribute $ This $ pure $
    { key: "error", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnError (Event.Event  (Effect Unit) ) where
  attr OnError eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "error", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnError (ST.ST Global.Global  (Effect Unit) ) where
  attr OnError stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "error", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnError (NonEmpty.NonEmpty Event.Event  (Effect Boolean) ) where
  attr OnError bothValues = unsafeAttribute $ Both (pure 
    { key: "error", value: cb' (Cb (const (NonEmpty.head bothValues))) })
    ( NonEmpty.tail bothValues <#> \value ->
        { key: "error", value: cb' (Cb (const value)) }
    )
instance Attr anything OnError (Product.Product (ST.ST Global.Global) Event.Event  (Effect Boolean) ) where
  attr OnError (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \value ->  
    { key: "error", value: cb' (Cb (const (value))) })
    ( Tuple.snd bothValues <#> \value ->
        { key: "error", value: cb' (Cb (const value)) }
    )
instance Attr anything OnError  (Effect Boolean)  where
  attr OnError value = unsafeAttribute $ This $ pure $
    { key: "error", value: cb' (Cb (const value)) }
instance Attr anything OnError (Event.Event  (Effect Boolean) ) where
  attr OnError eventValue = unsafeAttribute $ That $ eventValue <#>
    \value -> { key: "error", value: cb' (Cb (const value)) }

instance Attr anything OnError (ST.ST Global.Global  (Effect Boolean) ) where
  attr OnError stValue = unsafeAttribute $ This $ stValue <#>
    \value -> { key: "error", value: cb' (Cb (const value)) }

instance Attr everything OnError (NonEmpty.NonEmpty Event.Event  Unit ) where
  attr OnError bothValues = unsafeAttribute $ Both (pure 
    { key: "error", value: unset' })
    (NonEmpty.tail bothValues <#> \_ -> { key: "error", value: unset' })
instance Attr everything OnError (Product.Product (ST.ST Global.Global) Event.Event  Unit ) where
  attr OnError (Product.Product bothValues) = unsafeAttribute $ Both (Tuple.fst bothValues <#> \_ ->  
    { key: "error", value: unset' })
    (Tuple.snd bothValues <#> \_ -> { key: "error", value: unset' })
instance Attr everything OnError  Unit  where
  attr OnError _ = unsafeAttribute $ This $ pure $ { key: "error", value: unset' }
instance Attr everything OnError (Event.Event  Unit ) where
  attr OnError eventValue = unsafeAttribute $ That $ eventValue <#> \_ ->
    { key: "error", value: unset' }

instance Attr everything OnError (ST.ST Global.Global  Unit ) where
  attr OnError stValue = unsafeAttribute $ This $ stValue <#> \_ ->
    { key: "error", value: unset' }
