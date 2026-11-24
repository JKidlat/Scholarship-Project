/**
 * @file users.routes.js
 * @description Express routes for user management operations.
 */

import { Router } from 'express';
import {
  getUsers,
  createAdmin,
  changePassword,
} from '../controllers/users.controller.js';

const router = Router();

router.get('/', getUsers);
router.post('/admin', createAdmin);
router.post('/change-password', changePassword);

export default router;
