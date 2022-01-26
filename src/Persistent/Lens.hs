{-# LANGUAGE DerivingStrategies    #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NoImplicitPrelude     #-}
{-# LANGUAGE ScopedTypeVariables   #-}
{-# LANGUAGE TypeFamilies          #-}

-- | Lenses for persistent.
module Persistent.Lens(entityIso, valueLens, keyLens) where

import Control.Lens
import Database.Persist.Types
import Prelude

-- | from an entity to a tuple and back
entityIso :: Iso' (Entity a) (Key a, a)
entityIso = iso (\(Entity a b) -> (a, b)) $ uncurry Entity

-- | A lens from an entity to it's value
valueLens :: Lens' (Entity a) a
valueLens = entityIso . _2

-- | A lens from an entity to it's key
keyLens :: Lens' (Entity a) (Key a)
keyLens = entityIso . _1
